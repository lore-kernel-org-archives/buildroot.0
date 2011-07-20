From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 20 Jul 2011 21:21:00 +0200
Subject: [Buildroot] [PATCH 1/2] linux: Add Linux Kernel extensions menu
In-Reply-To: <CAHeZHmur1_YCf3VHevMbSHY9D92FOSfSsn3mfjcc1M=VSy5v-g@mail.gmail.com>
References: <1310572380-26403-1-git-send-email-benoit.mauduit@gmail.com>
 <1310572380-26403-2-git-send-email-benoit.mauduit@gmail.com>
 <CAAXf6LVOjw_pePUqiN3ikG0N=y_H=hGC8CXYMnUYk8rLURLJ0A@mail.gmail.com>
 <CAHeZHmur1_YCf3VHevMbSHY9D92FOSfSsn3mfjcc1M=VSy5v-g@mail.gmail.com>
Message-ID: <20110720212100.058e6a2b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 20 Jul 2011 10:10:36 +0200,
Beno?t Mauduit <benoit.mauduit@gmail.com> a ?crit :

> You are right, this is a mistake.
> I suggest to name all linux makefile extension like that :
> "xenomai_ext.mk".
> And include them with:
> include linux/*_ext.mk

Or maybe, it's linux/linux.mk's job to include linux/linux-*-ext.mk, or
explicitly linux/linux-xenomai.mk ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
