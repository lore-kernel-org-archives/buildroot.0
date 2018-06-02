From: Romain Naour <romain.naour@gmail.com>
Date: Sat, 2 Jun 2018 16:56:17 +0200
Subject: [Buildroot] [PATCH 1/1] librtas: bump to version 2.0.1
In-Reply-To: <20180602144315.32208-1-fontaine.fabrice@gmail.com>
References: <20180602144315.32208-1-fontaine.fabrice@gmail.com>
Message-ID: <590fcbde-207a-9ae0-d27a-65332e36fbfc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

Le 02/06/2018 ? 16:43, Fabrice Fontaine a ?crit?:
> - Switch site to github
> - Move to autotools infrastructure
> - Remove patch (not needed anymore)
> - Since version 1.4 (January 2016), license is now LGPL-2.1+
> - Add hash for license file
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Did you check if powerpc-utils with rtas still build with this new version ?
IIRC, librtas package has been added by Sam Bobroff to be used with powerpc-utils.

Best regards,
Romain
