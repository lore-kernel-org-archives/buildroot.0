From: Richard Genoud <richard.genoud@gmail.com>
Date: Tue, 28 Apr 2015 12:24:46 +0200
Subject: [Buildroot] [PATCH RESEND] qt: add QT_COORD_TYPE to double
	option
In-Reply-To: <874mo0zj0r.fsf@dell.be.48ers.dk>
References: <1421750951-28114-1-git-send-email-richard.genoud@gmail.com>
 <1429691658-13139-1-git-send-email-richard.genoud@gmail.com>
 <874mo0zj0r.fsf@dell.be.48ers.dk>
Message-ID: <CACQ1gAjqihEG=j6BKSZcpdACD==-6VSiY6dFsDERzyXtHAM0zw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2015-04-28 11:42 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
>>>>>> "Richard" == Richard Genoud <richard.genoud@gmail.com> writes:
>
>  > From: Julien D'Ascenzio <jdascenzio@paratronic.fr>
>  > On ARM-based platforms, qreal is a typedef for float for performance
>  > reasons.
>  > But we may want a double precision anyway.
>
>  > Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>  > ---
>  > Rebased and compiled on master (21 april 2015) for arm926ej-s
>
> This causes compilation issues with the test module as it defines a
> template using double and one using qreal:
>
> http://autobuild.buildroot.net/?reason=qt-4.8.6
>
> Care to take a look and send a fix?
yes, I'll have a look.
thanks !
