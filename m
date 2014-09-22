From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 22 Sep 2014 19:29:25 +0200
Subject: [Buildroot] [PATCH v2] swig: add symlink to /usr/bin/swig2.0
In-Reply-To: <1411385468-24878-2-git-send-email-jeremy.rosen@openwide.fr>
References: <1411385468-24878-1-git-send-email-jeremy.rosen@openwide.fr>
 <1411385468-24878-2-git-send-email-jeremy.rosen@openwide.fr>
Message-ID: <20140922192925.02a189cc@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?my Rosen,

On Mon, 22 Sep 2014 13:31:08 +0200, J?r?my Rosen wrote:
> the cmake detection script provided with cmake will first look for a
> binary called swig2.0 then for a binary called swig
> 
> swig-host only installs a binary called swig and gets overridden by the
> version installed by the host distro. This symlink prevents that from
> happening
> 
> 
> Signed-off-by: J?r?my Rosen <jeremy.rosen@openwide.fr>

Ok, I've applied the patch now. However, I did some significant
improvements to the commit log, and also added a big comment in the
code to explain why we do this.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
