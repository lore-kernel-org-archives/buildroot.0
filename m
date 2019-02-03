From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 3 Feb 2019 22:30:06 +0100
Subject: [Buildroot] [PATCH v5] package/ntp: sntp time sync script
In-Reply-To: <CANQCQpao8HkkQWiZ+_v1B7=PwGeA83pVRkJJk3NdkPCMbGYQ1A@mail.gmail.com>
References: <1544586337-7888-1-git-send-email-matthew.weber@rockwellcollins.com>
 <b30f789e-46c6-b695-cb48-990624424f4d@mind.be>
 <CANQCQpao8HkkQWiZ+_v1B7=PwGeA83pVRkJJk3NdkPCMbGYQ1A@mail.gmail.com>
Message-ID: <beb437ea-27d7-6958-070d-88d9968bd540@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 03/02/2019 21:55, Matthew Weber wrote:
>>> diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
>>> old mode 100755
>>> new mode 100644
>>  I applied it now, but isn't this an accident?
> Accident but correct, right?  (guessing I wildcarded 644 the folder as
> part of cleanup) Then the install step correctly places the file and
> permissions.

 Hm, about half of our init scripts are executable and the other half are not...
Not sure what is the best option here. But keeping it consistent is probably
better :-)


 Regards,
 Arnout
