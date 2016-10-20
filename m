From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Oct 2016 10:25:51 +0200
Subject: [Buildroot] [PATCH 1/1] avahi: link with libintl if libglib2 is
 enabled
In-Reply-To: <20161019215535.52d363c0@free-electrons.com>
References: <1476802403-5879-1-git-send-email-johan.oudinet@gmail.com>
 <20161018172543.20a693fa@free-electrons.com>
 <CAJtjsKbAHTY4LwuS=oGpxhCf=hCupmk0Si7-kCTnA3YYtFbgfA@mail.gmail.com>
 <20161019145904.6a82c434@free-electrons.com>
 <CAJtjsKbabwixT3bieo4uXFFyUhA=JXgFsoV5Td=yB+JfckRY1w@mail.gmail.com>
 <ea383c3d-9ace-bafe-5c32-0bc8fad656c3@mind.be>
 <20161019215535.52d363c0@free-electrons.com>
Message-ID: <f9f29851-956b-5d87-d384-7b4883a4bfb9@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 19-10-16 21:55, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 19 Oct 2016 18:27:29 +0200, Arnout Vandecappelle wrote:
> 
>>  I would say: don't touch this now, and schedule it for discussion at the next
>> BR developer meeting.
> 
> I don't think we can do that: there is a real build failure today if we
> don't make a fix.

 With "don't touch this" I meant: apply this patch the way it is now (using our
traditional approach of adding -lintl), and delay reworking the whole thing
until FOSDEM.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
