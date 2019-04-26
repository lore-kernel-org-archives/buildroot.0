From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 26 Apr 2019 09:13:22 +0200
Subject: [Buildroot] [PATCH 1/1] package/bullet: extras needs dlfcn.h
 and threads
In-Reply-To: <20190425204922.9755-1-fontaine.fabrice@gmail.com>
References: <20190425204922.9755-1-fontaine.fabrice@gmail.com>
Message-ID: <20190426091322.1d70ea15@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 25 Apr 2019 22:49:22 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> extras needs dynamic library (dlfcn.h) and threads
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a2609de74c08d9287beb839b93794161a7868e30
>  - http://autobuild.buildroot.org/results/3e961d40f3d7003061eee0f7dc476d26c444bd7b
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/bullet/bullet.mk | 7 +++++++
>  1 file changed, 7 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
