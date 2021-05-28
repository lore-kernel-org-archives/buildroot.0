From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 28 May 2021 21:41:28 +0200
Subject: [Buildroot] [PATCH] package/nginx: fix NGINX pidfile handling
 systemd
In-Reply-To: <3ebb96db-8047-2fa0-b18e-50f58c459f0e@mind.be>
References: <20210521144149.35725-1-matthew.weber@collins.com>
 <20210526204856.GP3208066@scaer>
 <a6b5f2ef-b33a-e300-9e0b-478ea2296969@mind.be>
 <20210528113959.GB2788252@scaer>
 <4f98da29-4eb3-e5af-2139-a55d6defa12e@mind.be>
 <87lf7y274w.fsf@dell.be.48ers.dk>
 <3ebb96db-8047-2fa0-b18e-50f58c459f0e@mind.be>
Message-ID: <20210528194128.GG2788252@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Peter, Matthew, All,

On 2021-05-28 18:05 +0200, Arnout Vandecappelle spake thusly:
> On 28/05/2021 17:46, Peter Korsgaard wrote:
> > Notice that you can override the configuration on the command line with
> > the -g option (-g 'daemon off;')
>  I didn't realize that was possible! Then we can do it from the service file
> directly, and it becomes trivial. Matt?

Ah indeed, that really sounds like the proper workaround/solution/fix.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
