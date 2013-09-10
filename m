From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 10 Sep 2013 22:58:53 +0200
Subject: [Buildroot] [PATCH 1/3] knock: new package
In-Reply-To: <CAAXf6LWfhUhQ2pRwaFh6szZ=51WfPPJNB2AVwzoodV0w4XT4DQ@mail.gmail.com>
References: <1378071216-19697-1-git-send-email-rommel@layer-7.net>
 <CAAXf6LXW8GfZzPAHkFjP_coASZ8CPNPNNc6=KjWrek94Ndn_cw@mail.gmail.com>
 <E9670545-EE12-445D-A15C-C0C3E4A4116A@layer-7.net>
 <1DD66D3B-6E8F-41C4-859E-A36677BA0A6B@layer-7.net>
 <CAAXf6LWfhUhQ2pRwaFh6szZ=51WfPPJNB2AVwzoodV0w4XT4DQ@mail.gmail.com>
Message-ID: <522F880D.1090904@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/09/13 16:32, Thomas De Schampheleire wrote:
> Another tip: for these type of dependency problems, you could also use
> an external toolchain, like the Sourcery ones, to get much quicker
> results. With such external toolchains, it also becomes very easy to
> test some other architectures like powerpc, arm, ...

  And you can also use the toolchains used by the autobuilders, to test 
with uClibc-based toolchains.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
