From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 2 May 2016 23:22:09 +0200
Subject: [Buildroot] [PATCH v2 1/1] flatcc: new package
In-Reply-To: <CAHXCMM+wVwqthUOEh+e3fHDA_=J0FS6FqG2cBF+zhVM0BGVoFQ@mail.gmail.com>
References: <1462145376-1377-1-git-send-email-steve.derosier@lairdtech.com>
 <CAHXCMM+wVwqthUOEh+e3fHDA_=J0FS6FqG2cBF+zhVM0BGVoFQ@mail.gmail.com>
Message-ID: <b32fd891-9ddb-9d43-7387-cc51b4f24071@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/02/16 21:44, Samuel Martin wrote:
> IMO (that does not include other developers), I tend to understand the
> "shared and static lib" option like this:
> "do your best, build some libs, shared or static or both, I don't
> really, but give me something I can use."

  I think it's more like: "In the past, we used to build both static and shared 
libraries in many cases. So let's try to keep doing that." What is very clear, 
however: when this option is enabled, shared libraries are preferred if both 
can't be built.

  But for me, I wouldn't care much if we just removed this option.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
