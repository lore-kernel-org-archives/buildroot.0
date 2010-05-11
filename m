From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Tue, 11 May 2010 17:59:01 -0300
Subject: [Buildroot] [Bug 1759] New: qt.mk stops build to prompts user
In-Reply-To: <bug-1759-163@https.bugs.busybox.net/>
References: <bug-1759-163@https.bugs.busybox.net/>
Message-ID: <AANLkTikbTZTFAb33JN-Jhd7Ohy4TujJFgiIf3Y582L2j@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Tue, May 11, 2010 at 11:14 AM,  <bugzilla@busybox.net> wrote:
> - ? ? ? ?./configure \
> + ? ? ? ?echo -e 'o\nyes\n' | ./configure \
> ? ? ? ? $(if $(VERBOSE),-verbose,-silent) \
> ? ? ? ? -force-pkg-config \
> ? ? ? ? -embedded $(BR2_PACKAGE_QT_EMB_PLATFORM) \
>

I haven't been using Buildroot and all, but what happened to
--accept-license? AFAIK, it's still there in the latest Qt source
package, and it was in the .mk file back when it was called qte

Kind Regards,
    Thiago A. Correa
