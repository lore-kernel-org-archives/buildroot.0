From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 17 Feb 2009 17:56:19 -0300
Subject: [Buildroot] Easy Upgrade Path?
In-Reply-To: <49922B53.50608@ethertek.ca>
References: <49907BAE.3020509@ethertek.ca>
	<d6cda7730902091413h5e7cbd21ra41d7154ca60909e@mail.gmail.com>
	<49922B53.50608@ethertek.ca>
Message-ID: <d6cda7730902171256y335886b6xb2924e2e69aa1c44@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, Feb 10, 2009 at 10:35 PM, Dan Pattison <dan.pattison@ethertek.ca> wrote:
> Thanks for the reply Thiago. I will see if I can get a svn server going and
> try your method.
>

   Just for the sake of documentation, if anyone wants to try my "home method",

   svn merge svn://uclibc.org/trunk/buildroot -rupstream.rev:HEAD

   Seams to work much, much better, and you get --dry-run to see will
be the merge result :)

   Please, notice again that there might be better methods. I tried to
locate the script Peter mentioned, but I couldn't get it to be
installed in my gentoo distro :(
   But svn merge seams to be doing what the perl script does.

Kind Regards,
    Thiago A. Correa
