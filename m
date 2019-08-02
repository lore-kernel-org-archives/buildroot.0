From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 2 Aug 2019 23:44:45 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/domoticz: bump to version
 4.10717
In-Reply-To: <20190521192516.452-2-fontaine.fabrice@gmail.com>
References: <20190521192516.452-1-fontaine.fabrice@gmail.com>
 <20190521192516.452-2-fontaine.fabrice@gmail.com>
Message-ID: <20190802234445.3142b8b5@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Tue, 21 May 2019 21:25:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> - Remove all patches (already in version)
> - Add patch to fix version
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

It turns out we have a fairly significant number of build failures of
domoticz in the version you bumped to. See:

  http://autobuild.buildroot.net/?reason=domoticz-4.10717

Could you perhaps have a look ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
