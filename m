From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 10 Feb 2012 23:55:55 +0100
Subject: [Buildroot] [RFC] progress indicator
In-Reply-To: <CAGm1_kt5qPOB2fpWNRREejgp5jMhsM+o0Dq5Po3LHMpySecEjw@mail.gmail.com>
References: <CAGm1_kt5qPOB2fpWNRREejgp5jMhsM+o0Dq5Po3LHMpySecEjw@mail.gmail.com>
Message-ID: <201202102355.55858.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thursday 09 February 2012 00:32:42 Yegor Yefremov wrote:
> What about making a progress indicator, so that user always knows how
> many packages left to be built? Like Android (AOSP) does during repo
> sync:
> 
> Fetching projects:  53% (127/238)  Receiving objects:  22% (290/1289), 195.95 Ki
> Fetching projects:  54% (129/238)  Receiving objects:  28% (361/1289), 195.95 Ki
> Fetching projects:  55% (131/238)  Receiving objects:  47% (606/1289), 643.81 Ki

 crosstool-NG does it as well.

 However, I don't see how you would do it without major surgery to the 
infrastructure.


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
