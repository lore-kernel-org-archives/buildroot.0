From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 22 Nov 2014 20:59:00 +0100
Subject: [Buildroot] [PATCH next v2] python-certifi: add new package
In-Reply-To: <20141122185640.GE4295@free.fr>
References: <1416649560-3561-1-git-send-email-yegorslists@googlemail.com>
 <20141122170934.GD4295@free.fr>
 <20141122190852.748af912@free-electrons.com>
 <20141122185640.GE4295@free.fr>
Message-ID: <20141122205900.5aa98365@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Sat, 22 Nov 2014 19:56:40 +0100, Yann E. MORIN wrote:

> > > sha1   f53dc8f57aaf6d69c183ebadcec52ece0a55cc3f                         certifi-14.05.14.tar.gz
> > > sha256 1e1bcbacd6357c151ae37cf0290dcc809721d32ce21fd6b7339568f3ddef1b69 certifi-14.05.14.tar.gz
> > 
> > Why do we suggest to have two hashes? Isn't sha265 sufficient?
> 
> As Gustavo said, that's because sha1 and sha256 are two different hash
> mechanisms, and it's better to have both.
> 
> So I was following his advice, even though I don't mind adding just the
> sha256.

Hum. We need some decision here :)

> > Also, is it necessary to align the different columns? Should it be done
> > with tabs or spaces? I've seen different solutions being used.
> 
> I don't mind not aligning the fields, though I find it more convenient
> to read if they are.
> 
> If they get aligned, I think we should use spaces; tabs do not help
> because people may have different tabwidths.
> 
> Also, aligning with spaces is what we are doing for _PREMISSIONS and
> _USERS, so I think that's OK to align.
> 
> Also, the manual states:
> 
>     Note: the number of spaces does not matter, so one can use spaces to
>     properly align the different fields.

And Peter, when reviewing the scancpan script, which did align things
with spaces, was wondering why the script was doing this weird
indentation.

We also need some decision here :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
