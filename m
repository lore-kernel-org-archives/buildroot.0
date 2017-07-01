From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 Jul 2017 15:01:01 +0200
Subject: [Buildroot] [Patch v6 0/7] Add support for the Rust programming
 language
In-Reply-To: <20170701112855.GA22905@itchy>
References: <20170625205614.6723-1-eric.le.bihan.dev@free.fr>
 <20170628122035.GB4971@momiji> <20170701112855.GA22905@itchy>
Message-ID: <0a5ac772-bf5a-c9e7-3125-6e151f8992db@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 01-07-17 13:28, Eric Le Bihan wrote:
>> Regarding the architecture backends to enable, I imagine we would want host
>> variant to have enabled *both* the host-native backend, and the target
>> backend. Example: When building for ARM in x86_64, we would enable the ?ARM?
>> and ?X86? LLVM backends for ?host-llvm?, and only ?ARM? for ?llvm? (the target
>> package). Would this be correct? Do you foresee any situation in which other
>> backends should be enabled for either the host or target variants? Should we
>> allow selecting from menuconfig which backends are compiled for the target
>> ?llvm? package?
> IMHO, it is best to keep it simple with only the host and the target archs.

 +1 to that.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
