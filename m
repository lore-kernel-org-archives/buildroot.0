From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 30 Mar 2018 23:12:04 +0200
Subject: [Buildroot] [PATCH v3 6/7] .gitlab-ci.yml: check flake8
In-Reply-To: <5aa9ad41d2fec_41fe2ab6b2513450655d5@ultri4.mail>
References: <20180313181519.GC4317@scaer>
 <5aa9ad41d2fec_41fe2ab6b2513450655d5@ultri4.mail>
Message-ID: <20180330211204.GB8894@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ricardo, All,

On 2018-03-14 20:16 -0300, Ricardo Martincoski spake thusly:
> On Tue, Mar 13, 2018 at 03:15 PM, Yann E. MORIN wrote:
> > On 2018-03-13 00:09 -0300, Ricardo Martincoski spake thusly:
> >> ---
> >> BEFORE APPLYING, see this note from Yann:
> >> Note: this can only be applied _after_ we regenerate the docker image.
> >> Then we'll have to update the version of the image at the top of the
> >> gitlab-ci.yml file.
> > Indeed, so I've marked this patch as "deferred" in patchwork, so it does
> > not get accidentally applied.
> Could you regenerate the image, please?
> I don't have the docker push permission.

Not sure if you were aware of it, but this has been done a little while
ago now. Tag 20180318.1724 is available:
    https://hub.docker.com/r/buildroot/base/tags/

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
