From: Akihiko Odaki <akihiko.odaki.4i@stu.hosei.ac.jp>
Date: Thu, 7 Jul 2016 08:25:10 +0900
Subject: [Buildroot] qt5: QT5_QMAKE spec bug
In-Reply-To: <5f3cc15c-6a24-e41a-993b-7c00d35e5a26@stu.hosei.ac.jp>
References: <5f3cc15c-6a24-e41a-993b-7c00d35e5a26@stu.hosei.ac.jp>
Message-ID: <83bdbc0d-5521-02c6-cffa-c35a6297c0d6@stu.hosei.ac.jp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ping

On 2016?06?28? 18:16, Akihiko Odaki wrote:
> Hi,
>
> I was trying to use QT5_QMAKE variable for a new package.
> http://article.gmane.org/gmane.comp.lib.uclibc.buildroot/152724
>
> However, it failed to build. I found that it failed because -spec option
> for cross compiling was applied for host_build. It can be fixed by
> setting the value to QMAKE_XSPEC in qmake configuration instead of using
> the option.
>
> I'm making a patch to apply the change, but I have a question. Now
> QT5_QMAKE variable has the path to qmake, but there are no variables to
> indicate the path for other commands such as python. Should I remove
> QT5_QMAKE variable or keep as it is?
>
> Regards,
> Akihiko
