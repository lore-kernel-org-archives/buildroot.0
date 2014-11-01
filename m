From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 21:31:17 +0100
Subject: [Buildroot] [PATCH] inetutils: new package
In-Reply-To: <CABbD_XA35CzC9nWkUnXnidJFEnZ0=yV1wd1f8FytjPKunw=uQg@mail.gmail.com>
References: <1414624048-37143-1-git-send-email-kaszak@gmail.com>
 <852735167.27218624.1414655605361.JavaMail.root@openwide.fr>
 <CABbD_XB2q_Vqn0cyJgHjeCPtLUrbC=rt7=VxLJhNwkX819Lu_A@mail.gmail.com>
 <20141030094018.GH1759@tarshish>
 <CABbD_XDXmwU5QgT0i=g=zs_13fBWPdv2Bn+WfFZMDU_YX8er+Q@mail.gmail.com>
 <20141030125801.GO1759@tarshish>
 <CABbD_XDu4yyqHX=0JbMg-4WpLivg7K41X62F6+BMtPT6NVS-dA@mail.gmail.com>
 <CABbD_XDjRYVSW4zLZhcOKD1asx8YMOk3+=L+d7teEr9cDhu1-A@mail.gmail.com>
 <20141101200125.509c0b89@free-electrons.com>
 <CABbD_XA35CzC9nWkUnXnidJFEnZ0=yV1wd1f8FytjPKunw=uQg@mail.gmail.com>
Message-ID: <20141101213117.6673aa69@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Sat, 1 Nov 2014 20:07:25 +0100, K?roly Kasza wrote:

> it is unpleasant indeed.
> What is the Buildroot recommended method for these issues?
> Should I modify the install target to overwrite the existing tools?

I'd say it depends on the cases. Can you do a summary of the situation,
i.e what tools inetutils installs and where, and how it compares with
the installation location of the same tools by Busybox? That might help
see how far we are, and what is the appropriate course of action.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
