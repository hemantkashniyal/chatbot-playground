import scrapy
from scrapy.crawler import CrawlerProcess
from chatbot_tools.scrapy.google_support_docs_spider import GoogleSupportDocsSpider

def run_scrapy():
    process = CrawlerProcess()
    process.crawl(GoogleSupportDocsSpider)
    process.start()
