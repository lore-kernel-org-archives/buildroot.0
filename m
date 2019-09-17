From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 17 Sep 2019 23:53:59 +0200
Subject: [Buildroot] buildroot | Pipeline #82303484 has failed for
 master | 7af21c70
In-Reply-To: <5d7ea4c3e52b4_7ec83f8ed04e16e8332034b@sidekiq-asap-05-sv-gprd.mail>
References: <5d7ea4c3e52b4_7ec83f8ed04e16e8332034b@sidekiq-asap-05-sv-gprd.mail>
Message-ID: <463e01cd-5bd5-5c58-8245-296c7d16a789@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Matt,

On 15/09/2019 22:53, GitLab wrote:
> GitLab
> ? 	Your pipeline has failed.
[snip]
> Pipeline #82303484
> <https://gitlab.com/buildroot.org/buildroot/pipelines/82303484> triggered by 	
> arnout <https://gitlab.com/arnout>
> 
> had 1 failed build.
> Logs may contain sensitive data. Please consider before forwarding this email.
> ? 	test
> 
> 	check-package <https://gitlab.com/buildroot.org/buildroot/-/jobs/295683825>
> 
> 0 warnings generated
> 34369 lines processed
> 1 warnings generated
> package/bc/bc.mk:8: remove default value of _SOURCE variable
> (http://nightly.buildroot.org/#generic-package-reference)

 Could you fix this check-package warning?

 Regards,
 Arnout

> 50888 lines processed
> 0 warnings generated
> Makefile:1191: recipe for target 'check-package' failed
> make: *** [check-package] Error 1
> ERROR: Job failed: exit code 1
> 
> GitLab
> You're receiving this email because of your account on gitlab.com. Manage all
> notifications <https://gitlab.com/profile/notifications> ? Help
> <https://gitlab.com/help>
> 
