From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 26 Mar 2016 19:15:54 +0100
Subject: [Buildroot] [Buildroot PATCH v2 1/1] raptor: new package
In-Reply-To: <1458641641-17752-1-git-send-email-nitin.mendiratta@rockwellcollins.com>
References: <1458641641-17752-1-git-send-email-nitin.mendiratta@rockwellcollins.com>
Message-ID: <20160326191554.194d6f99@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 22 Mar 2016 15:44:01 +0530, Nitin Mendiratta wrote:
> From: Matt Weber <matthew.weber@rockwellcollins.com>
> 
> Raptor is a free software / Open Source C library that provides a set of parsers
> and serializers that generate Resource Description Framework (RDF) triples
> by parsing syntaxes or serialize the triples into a syntax.
> 
> http://librdf.org/raptor/
> 
> Patch added in the package:
> 0001-configure.ac-remove-conditional-lib-inclusion.patch
> 
> Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com>
> Signed-off-by: Nitin Mendiratta <nitin.mendiratta@rockwellcollins.com>

Thanks, I've applied, after fixing the comments made by Baruch.

>  ...igure.ac-remove-conditional-lib-inclusion.patch | 21 +++++++++++++

Also, please contribute this patch to the upstream project. The
upstream project is hosted on Github, so it's really trivial to
contribute things upstream.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
