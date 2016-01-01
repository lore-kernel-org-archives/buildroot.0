From: Steve Calfee <stevecalfee@gmail.com>
Date: Fri, 1 Jan 2016 09:17:07 -0800
Subject: [Buildroot] [PATCH 1/1] python-paho-mqtt: add new package
In-Reply-To: <568446B3.50000@mind.be>
References: <1451307455-23911-1-git-send-email-zinosat@tiscali.it>
 <20151228142514.58df0700@free-electrons.com>
 <568446B3.50000@mind.be>
Message-ID: <CAJJ6jxt4My5Hyb3KhCepgq9MKeh+MRW6P2XvdmehxS44PqWN6w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 30, 2015 at 1:03 PM, Arnout Vandecappelle <arnout@mind.be>
wrote:

> On 28-12-15 14:25, Thomas Petazzoni wrote:
> > On Mon, 28 Dec 2015 13:57:35 +0100, Davide Viti wrote:
> >
> >> > diff --git a/package/python-paho-mqtt/Config.in
> b/package/python-paho-mqtt/Config.in
> >> > new file mode 100644
> >> > index 0000000..1b20da9
> >> > --- /dev/null
> >> > +++ b/package/python-paho-mqtt/Config.in
> >> > @@ -0,0 +1,9 @@
> >> > +config BR2_PACKAGE_PYTHON_PAHO_MQTT
> >> > +  bool "python-paho-mqtt"
> >> > +  help
> >> > +    The Paho Python Client provides a client class with support
> >> > +    for both MQTT v3.1 and v3.1.1 on Python 2.7 or 3.x. It also
> >> > +    provides some helper functions to make publishing one off
> >> > +    messages to an MQTT server very straightforward.
> > I know it was copy/pasted from the website, but this last sentence
> > doesn't make much sense to me. Maybe it's because I'm not a native
> > speaker, but "publishing one off messages" is not something that I can
> > parse. Did they mean "publishing on/off messages" ? Or something else ?
> >
>
>  They mean "publishing one-off messages", which I guess translates to
> having a
> simple function to publish a message without the need for setting up a
> connection etc.
>
>  Regards,
>  Arnout
>
> ?
> one-off
> British informal
> *adjective*
> adjective: *one-off*
>
>    1. *1*.
>    done, made, or happening only once and not repeated.
>    "one-off tax deductible donations to charity"
>
> *noun*
> noun: *one-off*; plural noun: *one-offs*
>
>    1. *1*.
>    something done, made, or happening only once, not as part of a regular
>    sequence.
>    "the meeting is a one-off"
>    - a person who is unusual or unique, especially in an admirable way.
>       "he's a one-off, no one else has his skills"
>
> ?My interpretation: A hack or something done quick and dirty without
> setting up infrastructure etc.
>

?Regards, Steve?
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160101/0bf1c070/attachment.html>
