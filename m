From: Lloyd Sargent <lloyd@cannasoftware.com>
Date: Wed, 1 Apr 2009 09:01:25 -0500
Subject: [Buildroot] Working on a wxWidgets build
In-Reply-To: <87iqlo7b56.fsf@macbook.be.48ers.dk>
References: <79A10089-9847-4B61-A91D-0C0AA181F1C1@cannasoftware.com>
	<87iqlo7b56.fsf@macbook.be.48ers.dk>
Message-ID: <C7FD972F-917F-4D1C-BEB4-F616D808EF56@cannasoftware.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Apr 1, 2009, at 8:32 AM, Peter Korsgaard wrote:

>>>>>> "Lloyd" == Lloyd Sargent <lloyd@cannasoftware.com> writes:
>
> Hi,
>
> Lloyd> foo: uclibc ncurses $(TARGET_DIR)/$(FOO_TARGET_BINARY)
>
> Lloyd> Which makes sense. However I need something along the lines of:
>
> Lloyd> foo: uclibc libglib2 libgtk2  $(TARGET_DIR)/$ 
> (FOO_TARGET_BINARY)
>
> Lloyd> for one set of options and
>
> Lloyd> foo: uclibc $(TARGET_DIR)/$(FOO_TARGET_BINARY)
>
> Lloyd> for a different set of options.
>
> Stick them in a variable or use the $(if ) construct. See
> package/grep/grep.mk or package/multimedia/alsa-utils/alsa-utils.mk
> for examples.

Ah, but of course (slaps himself on the head). Thanks!

Cheers,

Lloyd
