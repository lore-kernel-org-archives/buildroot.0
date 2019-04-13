From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 13 Apr 2019 17:24:07 +0200
Subject: [Buildroot] [PATCHv5 1/9] support/download: reintroduce
 'source-check' target
In-Reply-To: <0a9e8f22-a95f-47d3-612e-23bcca6c20a6@mind.be>
References: <20190219103839.25409-1-patrickdepinguin@gmail.com>
 <20190317143215.GD14237@scaer> <20190317155719.14839925@windsurf>
 <69fd8276-ea53-75a5-240a-a0e146cd8b62@mind.be>
 <20190327173548.7db271b5@windsurf>
 <0a9e8f22-a95f-47d3-612e-23bcca6c20a6@mind.be>
Message-ID: <c2ae9ea6-d77f-be81-a991-6efa933a258d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Thomas DS,

On 27/03/2019 18:25, Arnout Vandecappelle wrote:
> 
> 
> On 27/03/2019 17:35, Thomas Petazzoni wrote:
[snip]
>> We already have "make external-deps" but it only prints the file names,
>> not the full URL.
> 
>  True! So, we could extend external-deps with printing the URL (similar to how
> printvars uses RAW_VARS maybe, to not break existing scripts using
> external-deps). We could have variables to ask for primary, upstream or secondary.

 With Yann's show-info series on its way in, can we consider this series as
Rejected?

 Thanks for the patches anyway, it was the push needed to get Yann to implement
the Right Thing (tm) :-)

 Regards,
 Arnout
