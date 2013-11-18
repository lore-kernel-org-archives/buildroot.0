From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 19 Nov 2013 00:15:40 +0100
Subject: [Buildroot] Autobuilder site back online
In-Reply-To: <20131117175034.GC4425@free.fr>
References: <20131116223632.462c6e60@skate> <20131117172917.GB4425@free.fr>
 <20131117175034.GC4425@free.fr>
Message-ID: <528A9F9C.6040401@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/11/13 18:50, Yann E. MORIN wrote:
> Thomas, All,
> 
> On 2013-11-17 18:29 +0100, Yann E. MORIN spake thusly:
>> >Here are a few analysis of some of the build failures:
> Here are a few more (note: I'm only doing analysis for now):

 One more:

http://autobuild.humanoidz.org/results/05f/05ff0f5ea99df806589c9d2c0aa5d991ae299f5c/
 -> passing 'const QAtomicPointer<pcre16_extra>' as 'this' argument of 'T* QBasicAtomicPointer<T>::loadAcquire() [with T = pcre16_extra]' discards qualifiers
 -> upstream bug, fixed in Fedora https://bugzilla.redhat.com/attachment.cgi?id=812643

 Unfortunately, seems Fedora didn't upstream it.

 I don't have time to test the patch, so perhaps someone else can take
it over?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
