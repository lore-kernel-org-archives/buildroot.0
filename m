From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 22 Oct 2013 14:50:48 -0300
Subject: [Buildroot] [PATCH] uboot-tools: fix license issues
In-Reply-To: <80f8029e-950e-4229-88fe-9096d2f78718@email.android.com>
References: <1382452676-2514-1-git-send-email-gustavo@zacarias.com.ar>
 <87iowpb6q3.fsf@dell.be.48ers.dk>
 <80f8029e-950e-4229-88fe-9096d2f78718@email.android.com>
Message-ID: <5266BAF8.1080808@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/22/2013 02:01 PM, Thomas De Schampheleire wrote:

>> Ehh, we do support multiple versions of u-boot, but only a single
>> version of uboot-tools, so it makes sense to just change it to
>> Licenses/..
> 
> 
> Sure, but the mentioned problem remains for uboot proper right?

The problem is a bit more complicated for uboot proper.
The README says the u-boot part is GPL, but some extras (preloaders,
etc) might not be, so even if we fail silently to cover the different
uboot versions that might not be enough (i.e. GPL won't be enough
depending on the target).
Regards.
