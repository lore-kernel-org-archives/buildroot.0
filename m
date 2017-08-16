From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 16 Aug 2017 21:29:37 +0200
Subject: [Buildroot] Failing defconfigs due to GCC 6
In-Reply-To: <CAHkwnC9pJMX2AxcHsyMHiPMx_F8vDLNDp0sCFuSdcz0hNhdPSg@mail.gmail.com>
References: <15ef0875-b514-cb30-02df-d5d413bb0ea9@mind.be>
 <dbe1c07b-acac-59b8-70c8-dc10b7375a12@mind.be>
 <CAHkwnC9pJMX2AxcHsyMHiPMx_F8vDLNDp0sCFuSdcz0hNhdPSg@mail.gmail.com>
Message-ID: <6434cf22-c37a-5633-d399-1705f7e1fb60@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 14-08-17 08:52, Fabio Porcedda wrote:
> If possible i would like to backport the patch to support GCC 6 in the
> mean time.

 That's fine, or alternatively (if you're pretty sure you can find a fundamental
fix eventually) you can just fix GCC to version 5 for now. Up to you.

 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
