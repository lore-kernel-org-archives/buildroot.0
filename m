From: Dmitry Golubovsky <golubovsky@gmail.com>
Date: Wed, 12 Sep 2012 05:30:58 -0400
Subject: [Buildroot] [PATCH 2/4] Make Berkeley DB a dependency of
 linux-pam and make sure it is selected
In-Reply-To: <50501E2C.6080306@mind.be>
References: <1347078066-25257-1-git-send-email-golubovsky@gmail.com>
 <1347078066-25257-2-git-send-email-golubovsky@gmail.com>
 <504F8E7B.1060102@mind.be>
 <CADiAo4KFXtMDJqfjtVS1pu2EkHC=2EOFZ1LaN4dWw-ig9QsuGw@mail.gmail.com>
 <50501E2C.6080306@mind.be>
Message-ID: <CADiAo4JjqO_4mFFngp0cw6=rgskOTjMnk=52xzyL20dyL0-b-g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Wed, Sep 12, 2012 at 1:31 AM, Arnout Vandecappelle <arnout@mind.be> wrote:

>
>  Since these patches are still under review, maybe it's best to first
> commit an individual patch that just does --disable-db ?  Can you do
> that and check if it fixes the autobuilder issue?
>

I have just submitted such patch. Let's see how autobuilder results
change. In my test linux-pam compiled without pam_userdb.so, and
berkeleydb was selected in menuconfig.

Thanks.

-- 
Dmitry Golubovsky

Anywhere on the Web
