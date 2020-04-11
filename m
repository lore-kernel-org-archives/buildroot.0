From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 11 Apr 2020 10:02:29 +0200
Subject: [Buildroot] [PATCH 1/1] package/boinc: set curl-config
In-Reply-To: <20200410210025.738362-1-fontaine.fabrice@gmail.com>
References: <20200410210025.738362-1-fontaine.fabrice@gmail.com>
Message-ID: <20200411100229.5b41b1e7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, 10 Apr 2020 23:00:25 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Build can fail because boinc uses curl-config that it founds on host:
> 
> checking for curl-config... /usr/bin/curl-config
> checking for the version of libcurl... 7.47.0
> checking for libcurl >= version 7.17.1... yes
> checking whether libcurl is usable... no
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/26ab8024e3ef70b898981763f4ea89b647cc9f4b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/boinc/boinc.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
