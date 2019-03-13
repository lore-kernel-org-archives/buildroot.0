From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 13 Mar 2019 10:05:19 +0100
Subject: [Buildroot] [RFC v1] package/gst1-plugins-bad: add webrtcbin
 option
In-Reply-To: <20190312222745.06cf1b34@windsurf>
References: <20190310175109.13444-1-ps.report@gmx.net>
 <20190312222745.06cf1b34@windsurf>
Message-ID: <71e0a8c0-0809-e02c-cb29-25b2771202bd@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/03/2019 22:27, Thomas Petazzoni wrote:
> Hello,
> 
> +Arnout in Cc, our Config.in.legacy/backward-compatibility guru.
> 
> On Sun, 10 Mar 2019 18:51:09 +0100
> Peter Seiderer <ps.report@gmx.net> wrote:
> 
>> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>> ---
>> Notes:
>>   - just compile tested yet
>>   - named webrtcbin option (instead of webrtc), because of the
>>     BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC entry in Config.in.legacy
>>     (see [1] for history)
> 
> Would it be a big problem to reuse the
> BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_WEBRTC option ?

 I believe the plugin got a different name, and is used in a different way. So
reusing the same option could lead to things that stop working - if it's a
different name, at least there is still the legacy warning.

 That said, in -bad API changes sometimes happen anyway, so maybe we shouldn't
worry too much about that.

 Regards,
 Arnout
