From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 16 May 2014 20:49:54 +0200
Subject: [Buildroot] [PATCH] package/avahi: does not build with
 static-only
In-Reply-To: <20140516201650.5805db3e@free-electrons.com>
References: <1400256681-30273-1-git-send-email-yann.morin.1998@free.fr>
 <20140516201650.5805db3e@free-electrons.com>
Message-ID: <20140516184954.GA3466@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-05-16 20:16 +0200, Thomas Petazzoni spake thusly:
> Dear Yann E. MORIN,
> 
> On Fri, 16 May 2014 18:11:21 +0200, Yann E. MORIN wrote:
> > From: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > ---
> >  package/avahi/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> 
> Autobuilder reference?

Gah, I forgot to add it...

Fixes (which I reproduced here):
    http://autobuild.buildroot.net/results/ea2/ea2c8f20c4032bf82876805ea787a55834091cec

Should fix (which I did not even try to reproduce):
    http://autobuild.buildroot.net/results/4ef/4ef5bfc17f50bddb00f7ef3d62fc1fe963b7da82
    http://autobuild.buildroot.net/results/76e/76e4854812b0ef3862c080eead4012b35ef27f0f
    http://autobuild.buildroot.net/results/5bf/5bfb3fd9fe61bef5f998dc5999ce2060c334662c
    http://autobuild.buildroot.net/results/dc6/dc607c35471ef6dda04e06ad05ae7794615af578
    [...]

I'll respin it later with those references added...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
