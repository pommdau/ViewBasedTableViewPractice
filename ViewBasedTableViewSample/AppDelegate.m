//
//  AppDelegate.m
//  ViewBasedTableViewSample
//
//  Created by HIROKI IKEUCHI on 2019/04/26.
//  Copyright © 2019年 hikeuchi. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()
@property NSArray *pokemons;    // テーブルビューに表示するポケモンのデータ
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)awakeFromNib {
    // 表示するデータを作成
    _pokemons = @[@{@"name": @"ピカチュウ", @"type": @"でんき"},
                  @{@"name": @"ヒトカゲ" , @"type": @"ほのお"},
                  @{@"name": @"ゼニガメ" , @"type": @"みず"},
                  @{@"name": @"フシギダネ", @"type": @"くさ/どく"}];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

#pragma mark - NSTableView data source
- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return _pokemons.count;
}

- (NSView *)tableView:(NSTableView *)tableView
   viewForTableColumn:(NSTableColumn *)tableColumn
                  row:(NSInteger)row{
    NSString        *identifier = tableColumn.identifier;
    NSDictionary    *pokemon    = _pokemons[row];
    NSTableCellView *cellView   = [tableView makeViewWithIdentifier:identifier owner:self];
    cellView.textField.stringValue = pokemon[identifier];
    return cellView;
}

@end
