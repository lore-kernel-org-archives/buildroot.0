From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jul 2016 12:11:41 +0200
Subject: [Buildroot] [PATCH 3/6] docs/manual: Document the variable
 $(PKG)_DL_REFERER
In-Reply-To: <57836D3D.5020801@free-electrons.com>
References: <1468226925-21264-1-git-send-email-romain.perier@free-electrons.com>
 <1468226925-21264-4-git-send-email-romain.perier@free-electrons.com>
 <20160711112709.448eaec2@free-electrons.com>
 <57836D3D.5020801@free-electrons.com>
Message-ID: <20160711121141.23703922@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 11 Jul 2016 11:56:13 +0200, Romain Perier wrote:

> > This big chunk of change seems completely unrelated to your patch. Some
> > issue with your text editor?  
> 
> I just added this variable to the example. By doing so, it shifts the 
> lines number. However, I don't think that's very useful to add this 
> variable to this snippet of code, because this example seems to be 
> helpful only for the most basic common cases.

Yeah, sorry, I missed the fact that you added a <pkg>_DL_REFERER
example (it was lost in the "noise" of the patch).

But indeed, I don't think adding DL_REFERER to the example is useful.
Only package needs it as of now, and I don't expect many packages to
need that in the future. So having it in the reference of available
variables is definitely necessary (we document *all* variables), but
not in the example of the tutorial.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
