From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 20 May 2013 11:22:07 +0300
Subject: [Buildroot] [PATCH] wireshark: security bump to version 1.8.7
In-Reply-To: <5199978C.3040702@zacarias.com.ar>
References: <1369007247-27993-1-git-send-email-gustavo@zacarias.com.ar>
 <20130520025525.GC7188@tarshish> <5199978C.3040702@zacarias.com.ar>
Message-ID: <20130520082207.GE7188@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gustavo,

On Mon, May 20, 2013 at 12:25:00AM -0300, Gustavo Zacarias wrote:
> On 05/19/2013 11:55 PM, Baruch Siach wrote:
> > Have you seen an actual build failure caused by this missing dependency?
> 
> No, it's unreachable because glib2 is always failing before with it's
> own fork()ing.
> It's used in capture_sync.c which is mandatory even for tshark, so it
> would fail even if glib2 worked.

OK, thanks. So, FWIW:

Acked-by: Baruch Siach <baruch@tkos.co.il>

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
