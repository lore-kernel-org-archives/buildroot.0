From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 15 Mar 2016 12:26:36 +0000
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2016-03-14
In-Reply-To: <20160315073022.B57511011CC@stock.ovh.net>
References: <20160315073022.B57511011CC@stock.ovh.net>
Message-ID: <56E7FF7C.7020100@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter and Thomas,

On 15/03/16 07:30, Thomas Petazzoni wrote:
> Build statistics for 2016-03-14

[...]

>       mipsel |                     mosh-1.2.5 | NOK | http://autobuild.buildroot.net/results/e0a130e8a43b92b10584435b8e0088f8e77a2691/

This one should be automatically fixed when this patch gets applied:

http://patchwork.ozlabs.org/patch/594919/

We have just released a new version of Buildroot and started a new
development cycle for the next release. I think it's a good moment to
apply a patch like that one so we will have plenty of time to fix the
problems that it may cause.

Regards,

Vincent.
