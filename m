From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 19:24:58 +0200
Subject: [Buildroot] [PATCH v2 00/10] autobuild-run: python3 compat and
 misc improvements
In-Reply-To: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
References: <1426693843-28792-1-git-send-email-dywi@mailerd.de>
Message-ID: <20150404192458.3b73dfff@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Erdmann,

On Wed, 18 Mar 2015 16:50:33 +0100, Andr? Erdmann wrote:

> Andr? Erdmann (10):
>   autobuild-run: fixup imports
>   autobuild-run, python3: dict.iteritems()->items()
>   autobuild-run, python3: decode subprocess output
>   autobuild-run, python3: encode/decode mmap data
>   autobuild-run: avoid use of builtin as varname
>   autobuild-run: reorganize imports
>   autobuild-run: move check_requirements() to SystemInfo

Those 7 first patches applied.

>   autobuild-run: encapsulate subprocess calls
>   autobuild-run: control subprocess env
>   autobuild-run: set locale to en_US or C

I'll need more time (or help from someone else) to review these changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
