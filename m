From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 25 Oct 2013 19:23:28 -0300
Subject: [Buildroot] [PATCH 2/5] boost: add host variant
In-Reply-To: <OFD1D9DF7F.3A82BA27-ON86257C0F.006A97BA-86257C0F.007833C7@rockwellcollins.com>
References: <1382703323-31038-1-git-send-email-gustavo@zacarias.com.ar>
 <1382703323-31038-2-git-send-email-gustavo@zacarias.com.ar>
 <OFD1D9DF7F.3A82BA27-ON86257C0F.006A97BA-86257C0F.007833C7@rockwellcollins.com>
Message-ID: <526AEF60.4080400@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/25/2013 06:53 PM, Ryan Barnett wrote:

> Gustavo,
> 
> Please see my comment below, otherwise looks good.
> 
> Gustavo Zacarias <gustavo@zacarias.com.ar> wrote on 10/25/2013 07:15:20 
> AM:
> 
>> +# keep host variant as minimal as possible
> 
> Could you expand more on what you are leaving enabled and why?

Just the barebones is enough for host-thrift (the tool) hence there's
nothing to gain from a full host-boost other than longer build times.
If the need arises it can be expanded in the future for other host-* users.
Regards.
