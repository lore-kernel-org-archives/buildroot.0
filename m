From: Michael Nosthoff <buildroot@heine.tech>
Date: Fri, 11 Sep 2020 16:46:22 +0200
Subject: [Buildroot] [PATCH 2/3] package/protobuf: bump version to 3.13
In-Reply-To: <20200911154953.53acdab7@windsurf.home>
References: <20200911132907.11748-1-buildroot@heine.tech>
 <20200911132907.11748-3-buildroot@heine.tech>
 <20200911154953.53acdab7@windsurf.home>
Message-ID: <f20ed541-234d-e7ec-4ce0-146e408540bf@heine.tech>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 11.09.2020 15:49, Thomas Petazzoni wrote:
> On Fri, 11 Sep 2020 15:29:07 +0200
> Michael Nosthoff via buildroot <buildroot@busybox.net> wrote:
> 
>>  # When bumping this package, make sure to also verify if the
>>  # python-protobuf package still works, as they share the same
>>  # version/site variables.
>> -PROTOBUF_VERSION = 3.12.4
>> +PROTOBUF_VERSION = 3.13.0
> 
> You need to update package/python-protobuf/python-protobuf.hash as
> well. We should actually update the comment above to make this clear.
> 

Oops, that slipped me. I'll update this as well.

What I noticed: the python-protobuf description contains a link to the
protobuf-c project [0]. Which is, from what I take from the description
on its website, an independently developed project. So it doesn't seem
to have a connection to the python package. Wouldn't it make more sense
to put the link to the google protobuf site [1] as it is in the protobuf
package?

Regards,
Michael

[0] https://github.com/protobuf-c/protobuf-c
[1] https://developers.google.com/protocol-buffers
