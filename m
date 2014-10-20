From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 20 Oct 2014 15:27:59 +0200
Subject: [Buildroot] [PATCH 1/2] system/skeleton: make nsswitch install
 conditional
In-Reply-To: <54450BF5.4000202@zacarias.com.ar>
References: <1413808086-12177-1-git-send-email-gustavo@zacarias.com.ar>
 <20141020150209.5f8b45a5@free-electrons.com>
 <54450BF5.4000202@zacarias.com.ar>
Message-ID: <20141020152759.4f438890@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Mon, 20 Oct 2014 10:19:49 -0300, Gustavo Zacarias wrote:

> Why? It doesn't write anything unless it's necessary and it's a pretty
> small check.
> And it's ok to duplicate code for this but not elsewhere? Isn't that
> inconsistent?

Well, it's just that I still have my pet project of graphing the size
installed by each package. And for this, every file not installed by a
package is a bit annoying, as we don't know to which package we should
account the installation of the file.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
