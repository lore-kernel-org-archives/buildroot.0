From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 04 Feb 2020 23:59:22 +0100
Subject: [Buildroot] [PATCH 2/2] docs/manual: describe the new
 <pkg>_IGNORE_CVES variable
In-Reply-To: <20200204215232.666841-3-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Tue, 4 Feb 2020 22:52:31 +0100")
References: <20200204215232.666841-1-thomas.petazzoni@bootlin.com>
 <20200204215232.666841-3-thomas.petazzoni@bootlin.com>
Message-ID: <87imkmvu0l.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  docs/manual/adding-packages-generic.txt | 14 ++++++++++++++
 >  1 file changed, 14 insertions(+)

 > diff --git a/docs/manual/adding-packages-generic.txt b/docs/manual/adding-packages-generic.txt
 > index baa052e31c..9a77923a92 100644
 > --- a/docs/manual/adding-packages-generic.txt
 > +++ b/docs/manual/adding-packages-generic.txt
 > @@ -488,6 +488,20 @@ not and can not work as people would expect it should:
 >    locations, `/lib/firmware`, `/usr/lib/firmware`, `/lib/modules`,
 >    `/usr/lib/modules`, and `/usr/share`, which are automatically excluded.
 
 > +* +LIBFOO_IGNORE_CVES+ is a space-separated list of CVEs that tells

Maybe 'CVE identifiers' instead of CVEs?

 > +  Buildroot CVE tracking tools which CVEs should be ignored for this

Maybe '.. list of CVE identifiers that should be ignored by the
Buildroot CVE trackign tool for this package.' ?

-- 
Bye, Peter Korsgaard
