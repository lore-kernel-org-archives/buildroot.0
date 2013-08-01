From: zhou qiang <zhouqiang.search@gmail.com>
Date: Thu, 1 Aug 2013 16:09:37 +0800
Subject: [Buildroot] How to login as root without password
In-Reply-To: <20130731171745.14ab06ab@skate>
References: <CAHbR41VH17_qSe3T92b=n61_f1a_64jVXy5rNCKaexajmWzt9g@mail.gmail.com>
 <CAAXf6LXRYRvhWwE-TnM2fnGPMp+s+eEa3oUQtwdatMPxP=vAyA@mail.gmail.com>
 <CAHbR41WGQDmkVy4TguM7KEO9hf6NpND=wQ1CiUWMgUwhWQRkiQ@mail.gmail.com>
 <CAAXf6LVa_tJZG8CQw2zUUdyOvMd7TAs5yfdtUtjKG5bcGqhdZw@mail.gmail.com>
 <CAHbR41Xzw1RsrR8ZykwvWjXyP_GKzQRWghTo0hjq2z=sPGsabQ@mail.gmail.com>
 <20130731171745.14ab06ab@skate>
Message-ID: <CAHbR41Xpc24ABATxBOrcsWVjsdh=y+663d86WYMPWbUknRzgbg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi  ,Thomas

Thank you for your suggestion and explanation .

Using post-script is a good choice in current situation and seems to  work
well
on arm board for me .

But let Buildroot to generate final jffs2 image is not my expected way.
 Just as explained
before we have an internal application to generate final jffs2 image .
 Fakeroot could not
be used in patch script , manually inputting command sequence in fakeroot
session  is not
accepted in our development rule .

Anyway , I am going to use post-script and thank you very much .

Regards ,
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130801/e84e8c10/attachment.html>
