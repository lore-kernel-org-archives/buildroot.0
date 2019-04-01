From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 1 Apr 2019 10:42:35 +0200
Subject: [Buildroot] Application for GSoC 2019
In-Reply-To: <MaRd7Vz-JL7q0r-ND0Fc0yd2ssbogpg4Ug3OTzZJvpFY0vuUi2NP_rbEEcXIHG3JW-zRNhOR3cn2cp_rpTN7u814-elpGb7QFwjvRQJ6Sy8=@protonmail.com>
References: <MaRd7Vz-JL7q0r-ND0Fc0yd2ssbogpg4Ug3OTzZJvpFY0vuUi2NP_rbEEcXIHG3JW-zRNhOR3cn2cp_rpTN7u814-elpGb7QFwjvRQJ6Sy8=@protonmail.com>
Message-ID: <e271432d-9859-9adb-3b88-47654c1acd22@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Dhyey,

 [Adding Matt in Cc since he's the main interested party in this CVE tracking.]

On 27/03/2019 19:01, Griffin98 wrote:
> Respected,
> 
> I want to work with your Organization as of Google Summer of Code 2019. My
> details are as follows:
> 
> _Name_: Dhyey Patel
> 
> _Github Profile_: github.com/griffin98 <http://github.com/griffin98>
> _Programming Skills_ :- C/C++, Embedded Linux,Embedded Android, Shell Scripting,
> Python(Scripting, ML).
> 
> _Past Work Experience_:
> 
> 
> 1) LineageOS Official Maintainer of Galaxy s5(exynos)[DISCONTINUED]
> link:
> https://github.com/TeamExyKings/android_device_samsung_k3g/commits/lineage-15.1
> https://review.lineageos.org/q/griffin98
> 2) Worked on Android Kernels and Firmwares
> link: https://github.com/TeamExyKings/android_kernel_samsung_k3g/commits/working
> 3) Worked on Natural Language Processing RASA Stack in Python.
> Link: didn?t opensourced yet.
> 4) Worked on Few Python Project As well.
> 
> _Proposed Project to work_ : "Follow upstream updates and CVEs of packages".
> Motivation: Previously i worked on CVE tracker for kernel. Which some simply
> python flask application which uses RESTFUL API? to update the list of CVEs from
> https://cve.mitre.org/ and compare the kernel.Flask APP display the stats of
> Patched and Unpatched CVEs. Main motive of the tracker was to help developers to
> keep track of pending CVEs.


 That looks like interesting related project. Do you have a public repo with
that code somewhere?


 I've also taken a look at your draft proposal on the GSoC website. Note that
the part about tracking release-monitoring.org has already been implemented in
support/scripts/pkg-stats. The main goal of the project would be to identify
which CVEs are still open in the Buildroot package (and possibly which of those
would be closed by going to a more recent upstream version).


 It would also be better to post this idea on the mailing list, so more people
can comment on it. The GSoC website is only visible to the few people who are
official mentors, and we don't get any notification about updates there.

 Regards,
 Arnout
