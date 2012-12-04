From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 4 Dec 2012 06:44:29 +0100
Subject: [Buildroot] Figuring out selects
In-Reply-To: <CAE21AQo_fEOqWuzfN2Z3nWiUX+1MJi4JVw=jaiDDkY4CfD6byg@mail.gmail.com>
References: <CAE21AQo_fEOqWuzfN2Z3nWiUX+1MJi4JVw=jaiDDkY4CfD6byg@mail.gmail.com>
Message-ID: <CAHXCMMKBnrSBM_96p-Fz8iJaR4-RrSJHX5ESL0ZoJoJ4D8g+aw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Charles,

2012/12/4 Charles Manning <cdhmanning@gmail.com>:
> Hello All
>
> Is there any way to find out why a config item is selected?
Yes there is a way:
Read the help of the given item, you'll see different usefull information.

>
> For example libglib2 is selected by a package I am using. Which one?
>
> I could go through all the packages and figure it out eventually, but
> surely computers should do all the boring work.

Use the search tool in menuconfig ;-)
http://buildroot.org/downloads/manual/manual.html#make-tips

Regards,

-- 
Sam
