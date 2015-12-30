From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 30 Dec 2015 22:03:47 +0100
Subject: [Buildroot] [PATCH 1/1] python-paho-mqtt: add new package
In-Reply-To: <20151228142514.58df0700@free-electrons.com>
References: <1451307455-23911-1-git-send-email-zinosat@tiscali.it>
 <20151228142514.58df0700@free-electrons.com>
Message-ID: <568446B3.50000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28-12-15 14:25, Thomas Petazzoni wrote:
> On Mon, 28 Dec 2015 13:57:35 +0100, Davide Viti wrote:
> 
>> > diff --git a/package/python-paho-mqtt/Config.in b/package/python-paho-mqtt/Config.in
>> > new file mode 100644
>> > index 0000000..1b20da9
>> > --- /dev/null
>> > +++ b/package/python-paho-mqtt/Config.in
>> > @@ -0,0 +1,9 @@
>> > +config BR2_PACKAGE_PYTHON_PAHO_MQTT
>> > +	bool "python-paho-mqtt"
>> > +	help
>> > +	  The Paho Python Client provides a client class with support
>> > +	  for both MQTT v3.1 and v3.1.1 on Python 2.7 or 3.x. It also
>> > +	  provides some helper functions to make publishing one off
>> > +	  messages to an MQTT server very straightforward.
> I know it was copy/pasted from the website, but this last sentence
> doesn't make much sense to me. Maybe it's because I'm not a native
> speaker, but "publishing one off messages" is not something that I can
> parse. Did they mean "publishing on/off messages" ? Or something else ?
> 

 They mean "publishing one-off messages", which I guess translates to having a
simple function to publish a message without the need for setting up a
connection etc.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
