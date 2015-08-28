From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 28 Aug 2015 11:18:53 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-08-27
In-Reply-To: <20150828063010.3D17C101B6C@stock.ovh.net>
References: <20150828063010.3D17C101B6C@stock.ovh.net>
Message-ID: <55E0358D.30707@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas Petazzoni,

On 08/28/2015 07:30 AM, Thomas Petazzoni wrote:
> Build statistics for 2015-08-27

>         mips |                  python-2.7.10 | NOK | http://autobuild.buildroot.net/results/affb1d4a328c479be73b7818364db5914bf3d376/

I cannot reproduce this issue.

I checked out to the same commit ID the autobuilder was using:

$ git log -1 | head -n1
commit 2215b8a75edea384182f0511b6649306e60b55d1

I used the same exact .config file without any modifications, and the
package which was supposed to be failing built fine:

$ ls output/build/python-2.7.10/.stamp_target_installed
output/build/python-2.7.10/.stamp_target_installed

Regards,

Vincent.
