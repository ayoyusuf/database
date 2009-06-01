BEGIN;

-- Drop columns in tax table

COMMENT ON COLUMN tax.tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_sales_accnt_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_freight IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_cumulative IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_salesb_accnt_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_salesc_accnt_id IS 'Deprecated column - DO NOT USE';

-- Drop taxauth column in document tables

COMMENT ON COLUMN cmhead.cmhead_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cohead.cohead_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN custinfo.cust_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN itemtax.itemtax_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN prospect.prospect_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN quhead.quhead_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN rahead.rahead_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN shiptoinfo.shipto_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tohead.tohead_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vendaddrinfo.vendaddr_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vendinfo.vend_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_taxauth_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN whsinfo.warehous_taxauth_id IS 'Deprecated column - DO NOT USE';

-- Drop tax columns in document tables that were NOT moved to taxhist

COMMENT ON COLUMN coitem.coitem_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN quitem.quitem_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN raitem.raitem_tax_id IS 'Deprecated column - DO NOT USE';

COMMENT ON COLUMN custinfo.cust_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN custinfo.cust_taxidnum IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN pohead.pohead_tax IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN quhead.quhead_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN shiptoinfo.shipto_taxcode_id IS 'Deprecated column - DO NOT USE';

-- Drop tax columns in document tables that were moved to taxhist

COMMENT ON COLUMN asohist.asohist_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN asohist.asohist_tax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN asohist.asohist_tax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN asohist.asohist_tax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN asohist.asohist_tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN asohist.asohist_tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN asohist.asohist_tax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_tax IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_tax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_tax_curr_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_adjtax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_adjtax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_adjtax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_adjtax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_adjtax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_adjtax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_adjtax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_freighttax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_freighttax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_freighttax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_freighttax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_freighttax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_freighttax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmhead.cmhead_freighttax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmitem.cmitem_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmitem.cmitem_tax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmitem.cmitem_tax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmitem.cmitem_tax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmitem.cmitem_tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmitem.cmitem_tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cmitem.cmitem_tax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobill.cobill_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobill.cobill_tax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobill.cobill_tax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobill.cobill_tax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobill.cobill_tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobill.cobill_tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobill.cobill_tax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_tax IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_tax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_tax_curr_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_adjtax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_adjtax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_adjtax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_adjtax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_adjtax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_adjtax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_adjtax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_freighttax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_freighttax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_freighttax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_freighttax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_freighttax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_freighttax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cobmisc.cobmisc_freighttax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cohist.cohist_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cohist.cohist_tax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cohist.cohist_tax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cohist.cohist_tax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cohist.cohist_tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cohist.cohist_tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN cohist.cohist_tax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_tax IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_tax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_tax_curr_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_adjtax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_adjtax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_adjtax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_adjtax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_adjtax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_adjtax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_adjtax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_freighttax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_freighttax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_freighttax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_freighttax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_freighttax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_freighttax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invchead.invchead_freighttax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invcitem.invcitem_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invcitem.invcitem_tax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invcitem.invcitem_tax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invcitem.invcitem_tax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invcitem.invcitem_tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invcitem.invcitem_tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN invcitem.invcitem_tax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_freight IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_cumulative IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_salesb_accnt_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN tax.tax_salesc_accnt_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_tax_curr_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_adjtax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_adjtax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_adjtax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_adjtax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_adjtax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_adjtax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_adjtax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_freighttax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_freighttax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_freighttax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_freighttax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_freighttax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_freighttax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN vohead.vohead_freighttax_ratec IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN voitem.voitem_tax_id IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN voitem.voitem_tax_pcta IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN voitem.voitem_tax_pctb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN voitem.voitem_tax_pctc IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN voitem.voitem_tax_ratea IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN voitem.voitem_tax_rateb IS 'Deprecated column - DO NOT USE';
COMMENT ON COLUMN voitem.voitem_tax_ratec IS 'Deprecated column - DO NOT USE';
COMMIT;