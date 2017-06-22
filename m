From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Thu, 22 Jun 2017 17:14:46 +0200
Subject: [Buildroot] [PATCH] [PATCH v3] azure-iot-sdk-c: New package
In-Reply-To: <20170612224522.20315f78@windsurf.lan>
References: <1497297091-28452-1-git-send-email-nerv@dawncrow.de>
 <20170612224522.20315f78@windsurf.lan>
Message-ID: <9c36f963-518d-2213-c74c-af9381697fce@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 12.06.2017 um 22:45 schrieb Thomas Petazzoni:
> Hello,

Hi, thanks for the review

> On Mon, 12 Jun 2017 21:51:31 +0200, Andr? Hentschel wrote:
>> I use 2017-05-05 now, because newer versions will need some fixes (maybe as patches), so let's start with a cleaner version that just works.
> 
> Don't use "personal" sentences in commit logs, and rewrap commit logs
> at 72 characters. So something like:
> 
> """
> 
> Despite newer versions being available, this patch creates a package
> for version 2017-05-05, because newer version have issues that need to
> be addressed.
> 
> """

thx, done

>> Still, the projects install target installs the wrong files, that's
>> why commands are needed for staging_install and target_install.
> 
> Isn't it better to patch the package build system to fix those issues?

That would be quite a lot for the first introduction of the package.
I'll get in contact with the project to improve the situation in future versions

>>
>> v2: Rework the package with help from Arnouts comments
>> v3: Explain some things in the commit message
> 
> The commit log should go...
> 
>> Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
>> ---
> 
> ... here.
> 
> I typically do that by putting "---" below my SoB line, and writing the
> commit log (git commit --amend).

thx, done
