From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 31 Dec 2015 01:23:29 +0100
Subject: [Buildroot] [PATCH 0/84 RFC] all: use 'menuconfig' to group
 sub-options (branch yem/menuconfig)
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <56847581.6000407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25-12-15 22:25, Yann E. MORIN wrote:
> Hello All!
> 
> This RFC series is a proposal to cleanup the layout of the menuconfig
> UI. Although it looks to be pretty long (84 patches), it really is only
> three different changes :
> 
>   - patches 1-6: re-order comments to fix indentation of sub-options;
>     this can probably be applied without too much discussion, as it is
>     really only a cleanup;
> 
>   - patches 7-35: changes use of 'config'+'menu' into a 'menuconfig'
>     (the Kconfig keywords) to automatically arrange the sub-options into
>     sub-menus;
> 
>   - patches 36-84: document that packages with 5 or more options should
>     use sub-menus (with 'menuconfig') to store their sub-options
>     (patches 36-39); it then changes a lot of packages accordingly
>     (patches 40-84).

 I reviewed and tested patches 7-39, you can add my

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

to the ones where I didn't have comments. I didn't bother adding Acks everywhere
because it's anyway not going to be picked up by Patchwork.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
