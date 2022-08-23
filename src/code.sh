#!/bin/bash
# staarpipelinesummary_indvar_v0.9.6
# Generated by dx-app-wizard.
#
# Basic execution pattern: Your app will run on a single machine from
# beginning to end.
#
# Your job's input variables (if any) will be loaded as environment
# variables before this script runs.  Any array inputs will be loaded
# as bash arrays.
#
# Any code outside of main() (or any entry point you may add) is
# ALWAYS executed, followed by running the entry point itself.
#
# See https://documentation.dnanexus.com/developer for tutorials on how
# to modify this file.

main() {

    echo "Value of outfile: '$outfile'"
    echo "Value of test_type: '$test_type'"
    echo "Value of nullobj_file: '$nullobj_file'"
    echo "Value of chromosome: '$chromosome'"
    echo "Value of agds_file: '$agds_file'"
    echo "Value of annotation_name_catalog_file: '$annotation_name_catalog_file'"
    echo "Value of known_varlist_4columns: '$known_varlist_4columns'"
    echo "Value of gene_name: '$gene_name'"
    echo "Value of category: '$category'"
    echo "Value of start_loc: '$start_loc'"
    echo "Value of end_loc: '$end_loc'"
    echo "Value of max_maf: '$max_maf'"
    echo "Value of qc_label_dir: '$qc_label_dir'"
    echo "Value of variant_type: '$variant_type'"
    echo "Value of geno_missing_imputation: '$geno_missing_imputation'"
    echo "Value of annotation_dir: '$annotation_dir'"
    echo "Value of annotation_name: '$annotation_name'"
    
    # The following line(s) use the dx command-line tool to download your file
    # inputs to the local file system using variable names for the filenames. To
    # recover the original filenames, you can use the output of "dx describe
    # "$variable" --name".

    if [ -n "$annotation_name_catalog_file" ]
    then
        dx download "$annotation_name_catalog_file" -o annotation_name_catalog_file &
    annotation_name_catalog_file2="annotation_name_catalog_file"
    else
    annotation_name_catalog_file2="NO_ANNOTATION_NAME_CATALOG_FILE"
    fi
    if [ -n "$known_varlist_4columns" ]
    then
        dx download "$known_varlist_4columns" -o known_varlist_4columns &
    known_varlist_4columns2="known_varlist_4columns"
    else
    known_varlist_4columns2="NO_KNOWN_VARLIST_4COLUMNS"
    fi
    dx download "$nullobj_file" -o nullobj_file &
    nullobj_file2="nullobj_file"
    dx download "$agds_file" -o agds_file.gds &
    agds_file2="agds_file.gds"

    echo "Rscript --vanilla staarpipelinesummary_indvar.R $outfile $test_type $nullobj_file2 $chromosome $agds_file2 $annotation_name_catalog_file2 $known_varlist_4columns2 $gene_name $category $start_loc $end_loc $max_maf $qc_label_dir $variant_type $geno_missing_imputation $annotation_dir $annotation_name"
    dx-docker run -v /home/dnanexus/:/home/dnanexus/ -w /home/dnanexus/ zilinli/staarpipeline:0.9.6 Rscript --vanilla staarpipelinesummary_indvar.R $outfile $test_type $nullobj_file2 $chromosome $agds_file2 $annotation_name_catalog_file2 $known_varlist_4columns2 $gene_name $category $start_loc $end_loc $max_maf $qc_label_dir $variant_type $geno_missing_imputation $annotation_dir $annotation_name
    mkdir -p out/results
    mv ${outfile}.csv out/results
    dx-upload-all-outputs
}

