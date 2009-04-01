From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Wed, 1 Apr 2009 01:47:14 -0300
Subject: [Buildroot] misc development news
In-Reply-To: <874ox99yko.fsf@macbook.be.48ers.dk>
References: <87d4d4md5o.fsf@macbook.be.48ers.dk>
	<874ox99yko.fsf@macbook.be.48ers.dk>
Message-ID: <d6cda7730903312147i41ec576ar62e97a3a18832d67@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Mar 31, 2009 at 6:23 PM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> git clone ssh://uclibc.org/var/lib/git/buildroot.git
>
> But notice that you don't have write access, so you cannot push
> changes directly. Instead push your changes to your own tree and send
> pull requests to the list. You can add personal repos on uclibc.org by
> storing them in ~/git/ and touching ~/git/<repo>/git-daemon-export-ok,
> after which the hourly cronjob will pick them up and show them in
> cgit.
>
> I would like us to move to a setup similar to the kernel/uboot, where
> all changes get posted to the list before they get committed to the
> tree, and with package / sub-tree maintainers.
>

This means that I currently have absolutely no idea how to commit.
Could you document this better or point us to a "Git for idiots (with
subversion background)"?

About maintainers... I don't see any easy way to divide that between
the developers. Any suggestions?

We usually all touch the packages folder quite often, subdividing that
also doesn't seem good to me as we sure use most of the same packages
in our builds and would like to fix stuff right away.
Dividing by platforms still leaves a big chunk out.

On top of all that, there is the who problem. Concentrating all pulls
on you kind of defeats the purpose of us even having commit access in
the first place.

Kind Regards,
   Thiago A. Correa
