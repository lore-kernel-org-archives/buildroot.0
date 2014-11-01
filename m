From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 20:01:25 +0100
Subject: [Buildroot] [PATCH] inetutils: new package
In-Reply-To: <CABbD_XDjRYVSW4zLZhcOKD1asx8YMOk3+=L+d7teEr9cDhu1-A@mail.gmail.com>
References: <1414624048-37143-1-git-send-email-kaszak@gmail.com>
 <852735167.27218624.1414655605361.JavaMail.root@openwide.fr>
 <CABbD_XB2q_Vqn0cyJgHjeCPtLUrbC=rt7=VxLJhNwkX819Lu_A@mail.gmail.com>
 <20141030094018.GH1759@tarshish>
 <CABbD_XDXmwU5QgT0i=g=zs_13fBWPdv2Bn+WfFZMDU_YX8er+Q@mail.gmail.com>
 <20141030125801.GO1759@tarshish>
 <CABbD_XDu4yyqHX=0JbMg-4WpLivg7K41X62F6+BMtPT6NVS-dA@mail.gmail.com>
 <CABbD_XDjRYVSW4zLZhcOKD1asx8YMOk3+=L+d7teEr9cDhu1-A@mail.gmail.com>
Message-ID: <20141101200125.509c0b89@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear K?roly Kasza,

On Sat, 1 Nov 2014 19:33:16 +0100, K?roly Kasza wrote:

> I investigated the matter further.
> Looks like inetutils won't overwrite ifconfig or ping, because of a simple
> reason: it installs the binaries elsewhere.
> In these cases, both binaries will be present, and the $PATH will choose
> which to call.

This is not great. We don't really like having two variants of the same
tool in the filesystem.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
