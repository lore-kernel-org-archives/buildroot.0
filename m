From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Oct 2014 00:05:06 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-10-13
In-Reply-To: <CAMo8BfJKAS3HJcb1M4wXWGkUMigGk4rQbzShGwQXWus0yFoowQ@mail.gmail.com>
References: <20141014063014.67756100ECC@stock.ovh.net>
 <CAMo8BfJKAS3HJcb1M4wXWGkUMigGk4rQbzShGwQXWus0yFoowQ@mail.gmail.com>
Message-ID: <543D9E12.9000000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/10/14 00:01, Max Filippov wrote:
> On Tue, Oct 14, 2014 at 10:30 AM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
>> Build statistics for 2014-10-13
>>       xtensa | flann-d0c04f4d290ebc3aa9411... | NOK | http://autobuild.buildroot.net/results/d3ac726110f98d87042ff883b2bc4366a2b45ff2/
> 
> Mysterious failure:
> 
> [ 85%] Building C object src/cpp/CMakeFiles/flann_s.dir/flann/ext/lz4hc.c.o
> {standard input}: Assembler messages:
> {standard input}:516330: Warning: partial line at end of file ignored
> xtensa-buildroot-linux-uclibc-g++: internal compiler error: Killed
> (program cc1plus)

 Perhaps an OOM or something? Maxime, could you check in the syslogs?


 Regards,
 Arnout
-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
