From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Nov 2014 20:53:53 +0100
Subject: [Buildroot] [PATCH 3/9] ifupdown: new package
In-Reply-To: <CABbD_XBtqRu2L6rPmxjpp3TgoOMADTeVQXRpRMt4qKjRey0tdg@mail.gmail.com>
References: <1416330117-4458-1-git-send-email-gustavo@zacarias.com.ar>	<1416330117-4458-4-git-send-email-gustavo@zacarias.com.ar>	<CABbD_XCy1Nayf0SrA0Ae-vsFaKoM8xskE6K6UafmzN4=6aamwA@mail.gmail.com>
 <CABbD_XBtqRu2L6rPmxjpp3TgoOMADTeVQXRpRMt4qKjRey0tdg@mail.gmail.com>
Message-ID: <546BA3D1.1040805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/11/14 20:42, K?roly Kasza wrote:
> I don't know how should I propose a patch to a pending patch :)

 Like you did, except:

- never attach, always send in-line;

- don't top-post.


> So here's attached a patch file, to be put into the package/ifupdown directory.

 Patching the debian/* files isn't necessary, we don't use them.

 I agree with the solution of this patch. The alternative would be to create our
own dpkg-architecture in our HOST_DIR, but I think that's a bit too much to ask.


 Regards,
 Arnout

> 
> BR
> Karoly
> 
[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
