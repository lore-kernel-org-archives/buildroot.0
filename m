From: Derrick Pallas <derrick@meter.com>
Date: Wed, 14 Oct 2020 12:09:25 -0700
Subject: [Buildroot] [PATCH 1/1] package/ipcalc: new package
In-Reply-To: <20201014190614.30321-1-derrick@meter.com>
References: <20201014190614.30321-1-derrick@meter.com>
Message-ID: <d87dfc29-17fe-f4b6-a22c-57cc6f6b81a8@meter.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/20 12:06 PM, Derrick Lyndon Pallas wrote:
> ipcalc is an ancient and venerable tool for manipulating IP addresses,
> networks, & interfaces from shell scripts.  There is a subtool in busybox,
> but it does not support everything the upstream tool [1] supports.
> 
> [1] https://gitlab.com/ipcalc/ipcalc
> 
> Signed-off-by: Derrick Lyndon Pallas <derrick@meter.com>

Just a note: I did run utils/test-pkg (at the suggestion of Thomas 
Petazzoni) and there were no failures. ~Derrick
