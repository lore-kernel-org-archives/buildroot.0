From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:45:30 +0200
Subject: [Buildroot] [PATCH 01/15] fs: add genimage infra
In-Reply-To: <570EBAE6.1080000@mind.be>
References: <1460577820-32164-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1460577820-32164-2-git-send-email-ezequiel@vanguardiasur.com.ar>
 <570EBAE6.1080000@mind.be>
Message-ID: <20160413234530.502a4244@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 13 Apr 2016 23:32:22 +0200, Arnout Vandecappelle wrote:

>   Therefore, at least as a first step, I guess it's better to just move the 
> script to a common place, e.g. to package/genimage/post-image.sh. Let it take a 
> single argument for the genimage.cfg file, and add some documentation to the manual.

As an after-thought, this seems like a good idea. This is really a very
simple and minimal change, and is easy to do.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
