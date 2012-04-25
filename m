From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 25 Apr 2012 14:45:46 -0300
Subject: [Buildroot] [PATCH 1/4] package/multimedia: move networking
 libs out
In-Reply-To: <20120425193839.3b45570b@skate>
References: <1335370243-27044-1-git-send-email-gustavo@zacarias.com.ar>
 <20120425193839.3b45570b@skate>
Message-ID: <834c1b3a8e44b77b2fa173dba81e2ffc@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-25 14:38, Thomas Petazzoni wrote:

> Le Wed, 25 Apr 2012 13:10:40 -0300,
> Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :
>
>> Move networking libraries out of the Audio and Video category into 
>> the
>> Libaries/Networking one.
>
> I am not quite sure about this one. Even though it's true libmpd or
> live555 have networking capabilities, I think their core feature is
> more audio and/or video oriented, so it should be in some
> Libraries->Audio or Libraries->Audio/Video section rather than
> Libraries->Networking.
>
> Thomas

live555 can handle RTSP which can stream video also so it isn't clear 
cut.
libmpd as i said on IRC is a big grey thing, it does networking which 
is the way it controls mpd and it doesn't handle audio per se.
But mpd is an audio app and the protocol is quite explicit...
Let's "hear" some other voices and see, this was just a first shot.
Regards.
