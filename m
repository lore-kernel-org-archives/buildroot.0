From: Adam Duskett <aduskett@gmail.com>
Date: Sat, 4 Feb 2017 13:12:45 -0500
Subject: [Buildroot] [PATCH 03/11] dbus: bump to version 1.11.8
In-Reply-To: <8737fuyxb1.fsf@dell.be.48ers.dk>
References: <20170203202959.18916-1-aduskett@codeblue.com>
 <20170203202959.18916-3-aduskett@codeblue.com>
 <8737fuyxb1.fsf@dell.be.48ers.dk>
Message-ID: <CAFSsvmrG2TMYrOTPxAzoRr4e+PFoBtrCzuBP2_tO-_RjmnMYoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 4, 2017 at 7:06 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Adam" == Adam Duskett <aduskett@gmail.com> writes:
>
>  > Signed-off-by: Adam Duskett <aduskett@codeblue.com>
>  > ---
>  >  package/dbus/dbus.hash | 2 +-
>  >  package/dbus/dbus.mk   | 2 +-
>  >  2 files changed, 2 insertions(+), 2 deletions(-)
>
>  > diff --git a/package/dbus/dbus.hash b/package/dbus/dbus.hash
>  > index 14bee20..910a85c 100644
>  > --- a/package/dbus/dbus.hash
>  > +++ b/package/dbus/dbus.hash
>  > @@ -1,2 +1,2 @@
>  >  # Locally calculated after checking pgp signature
>  > -sha256      23238f70353e38ce5ca183ebc9525c0d97ac00ef640ad29cf794782af6e6a083  dbus-1.10.14.tar.gz
>  > +sha256      fa207530d694706e33378c87e65b2b4304eb99fff71fc6d6caa6f70591b9afd5  dbus-1.11.8.tar.gz
>  > diff --git a/package/dbus/dbus.mk b/package/dbus/dbus.mk
>  > index c765e0a..e74e8ba 100644
>  > --- a/package/dbus/dbus.mk
>  > +++ b/package/dbus/dbus.mk
>  > @@ -4,7 +4,7 @@
>  >  #
>  >  ################################################################################
>
>  > -DBUS_VERSION = 1.10.14
>  > +DBUS_VERSION = 1.11.8
>
> I believe dbus uses the gtk/gnome numbering scheme, where odd minor
> numbers (in major.minor.micro) means development versions. Looking at
> the DBus website I indeed see:
>
Good catch! Sorry about that and I do agree we should stick with the
1.10.x series.

> The current stable branch is D-Bus 1.10.x. This is the recommended
> version for most purposes.
>
> So I would prefer not to bump to the 1.11.x series. Is there any
> specific reason why you want to do this?
>
> --
Not at all!
> Bye, Peter Korsgaard

Adam
