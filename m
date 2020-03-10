From: Andreas Naumann <dev@andin.de>
Date: Tue, 10 Mar 2020 18:02:19 +0100
Subject: [Buildroot] [PATCH v6 01/28] package/qt5base: Do not build
 shared libs if BR2_STATIC_LIBS is chosen
In-Reply-To: <20200309222154.0eec932a@windsurf.home>
References: <20200217212350.29750-1-anaumann@ultratronik.de>
 <20200217212350.29750-2-anaumann@ultratronik.de>
 <20200309222154.0eec932a@windsurf.home>
Message-ID: <1042f249-3ea0-4754-54d9-84c531538e71@andin.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On 09.03.20 22:21, Thomas Petazzoni wrote:

> 
> So I don't think this patch is necessary, unless I missed something. 
> How did you test it?

I had in my original set (and tested it only back then). I didnt know if
Qt static build would ever be reenabled so I kept it. But it isnt
needed, so no problem omitting it.

regards,
Andreas

> 
> Thanks!
> 
> Thomas
> 
