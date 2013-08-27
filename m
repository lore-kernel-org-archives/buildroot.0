From: Simon Dawson <spdawson@gmail.com>
Date: Tue, 27 Aug 2013 09:16:55 +0100
Subject: [Buildroot] [RFC] uclibc: reinstate support for version 0.9.31
In-Reply-To: <20130827100209.4759e82f@skate>
References: <1376997241-20991-1-git-send-email-spdawson@gmail.com>
 <20130826163209.71188312@skate>
 <CAHt8ZCN7zEKhx3znac2=1Nha2z1Gi6vK9MrihVC2Dc=80OU_Wg@mail.gmail.com>
 <20130827100209.4759e82f@skate>
Message-ID: <CAHt8ZCMTy5nmpgMLwMVRt+z8W_-g02cLe=GHyUN0+8wp1ODNiQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 27 August 2013 09:02, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> > Maybe it was inotify that was missing, but I see you've backported the
>> > inotify support in 0.9.31. Or it was something else than inotify?
>>
>> I don't quite follow your meaning here... Are you referring to the
>> connman package specifically?
>
> Yes, I was referring to the connman package specifically.

Commit 96b109ad2a4ea0a4575526f0d0353d916b5122dd made connman
unavailable for uClibc 0.9.31 and 0.9.32, due to missing resolver
support in those versions. So this restriction does still need to be
in place, unfortunately.

SImon.
